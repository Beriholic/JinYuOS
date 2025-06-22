import "root:/modules/common"
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
pragma Singleton
pragma ComponentBehavior: Bound

/**
 * A nice wrapper for default Pipewire audio sink and source.
 */
Singleton {
    id: root

    property bool ready: Pipewire.defaultAudioSink?.ready ?? false
    property PwNode sink: Pipewire.defaultAudioSink
    property PwNode source: Pipewire.defaultAudioSource

    signal sinkProtectionTriggered(string reason);

    PwObjectTracker {
        objects: [sink, source]
    }

    Connections { // Protection against sudden volume changes
        target: sink?.audio ?? null
        property bool lastReady: false
        property real lastVolume: 0
        function onVolumeChanged() {
            if (!ConfigOptions.audio.protection.enable) return;
            if (!lastReady) {
                lastReady = true;
                const initialVolume = sink.audio.volume;
                const maxAllowed = ConfigOptions.audio.protection.maxAllowed;
                if (initialVolume > maxAllowed) {
                    sink.audio.volume = maxAllowed;
                    lastVolume = maxAllowed;
                } else {
                    lastVolume = initialVolume;
                }
                
                return;
            }
            const newVolume = sink.audio.volume;
            const maxAllowedIncrease = ConfigOptions.audio.protection.maxAllowedIncrease / 100; 
            const maxAllowed = ConfigOptions.audio.protection.maxAllowed;
            if (newVolume - lastVolume > maxAllowedIncrease) {
                sink.audio.volume = lastVolume;
                root.sinkProtectionTriggered("Illegal increment");
            } else if (newVolume > maxAllowed) {
                root.sinkProtectionTriggered("Exceeded max allowed");
                sink.audio.volume = Math.min(lastVolume, maxAllowed);
            }
            
            if (sink.ready && (isNaN(sink.audio.volume) || sink.audio.volume === undefined || sink.audio.volume === null)) {
                sink.audio.volume = 0;
            }
            lastVolume = sink.audio.volume;
        }
    }
}
