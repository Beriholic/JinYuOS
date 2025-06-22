import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland
import "root:/services/"
import "root:/modules/common/"
import "root:/modules/common/widgets/"
import "root:/modules/common/functions/color_utils.js" as ColorUtils
import "root:/modules/common/functions/file_utils.js" as FileUtils

ContentPage {
    baseWidth: lightDarkButtonGroup.implicitWidth
    forceWidth: true

    ContentSection {
        title: "Colors & Wallpaper"

        // Light/Dark mode preference
        ButtonGroup {
            id: lightDarkButtonGroup
            Layout.fillWidth: true
            LightDarkPreferenceButton {
                dark: false
            }
            LightDarkPreferenceButton {
                dark: true
            }
        }

        // Material palette selection
        ContentSubsection {
            title: "Material palette"
            ConfigSelectionArray {
                currentValue: ConfigOptions.appearance.palette.type
                configOptionName: "appearance.palette.type"
                onSelected: (newValue) => {
                    ConfigLoader.setConfigValueAndSave("appearance.palette.type", newValue);
                    Quickshell.execDetached(["bash", "-c", `${Directories.wallpaperSwitchScriptPath} --type ${newValue} --no-switch`])
                }
                options: [
                    {"value": "auto", "displayName": "Auto"},
                    {"value": "scheme-content", "displayName": "Content"},
                    {"value": "scheme-expressive", "displayName": "Expressive"},
                    {"value": "scheme-fidelity", "displayName": "Fidelity"},
                    {"value": "scheme-fruit-salad", "displayName": "Fruit Salad"},
                    {"value": "scheme-monochrome", "displayName": "Monochrome"},
                    {"value": "scheme-neutral", "displayName": "Neutral"},
                    {"value": "scheme-rainbow", "displayName": "Rainbow"},
                    {"value": "scheme-tonal-spot", "displayName": "Tonal Spot"}
                ]
            }
        }


        // Wallpaper selection
        ContentSubsection {
            title: "Wallpaper"
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                RippleButtonWithIcon {
                    materialIcon: "wallpaper"
                    StyledToolTip {
                        content: "Pick wallpaper image on your system"
                    }
                    onClicked: {
                        Quickshell.execDetached(`${Directories.wallpaperSwitchScriptPath}`)
                    }
                    mainContentComponent: Component {
                        RowLayout {
                            spacing: 10
                            StyledText {
                                font.pixelSize: Appearance.font.pixelSize.small
                                text: "Choose file"
                                color: Appearance.colors.colOnSecondaryContainer
                            }
                        }
                    }
                }
                RippleButtonWithIcon {
                    materialIcon: "wallpaper"
                    StyledToolTip {
                        content: "Random wallpaper image on your system"
                    }
                    onClicked: {
                        Quickshell.execDetached(`${Directories.wallpaperSwitchScriptPath} --random`)
                    }
                    mainContentComponent: Component {
                        RowLayout {
                            spacing: 10
                            StyledText {
                                font.pixelSize: Appearance.font.pixelSize.small
                                text: "Random file"
                                color: Appearance.colors.colOnSecondaryContainer
                            }
                        }
                    }
                }
            }
        }

        StyledText {
            Layout.topMargin: 5
            Layout.alignment: Qt.AlignHCenter
            text: "Alternatively use /dark, /light, /img in the launcher"
            font.pixelSize: Appearance.font.pixelSize.smaller
            color: Appearance.colors.colSubtext
        }
    
    }

    ContentSection {
        title: "Decorations & Effects"

        ContentSubsection {
            title: "Transparency"

            ConfigRow {
                ConfigSwitch {
                    text: "Enable"
                    checked: ConfigOptions.appearance.transparency
                    onCheckedChanged: {
                        ConfigLoader.setConfigValueAndSave("appearance.transparency", checked);
                    }
                    StyledToolTip {
                        content: "Might look ass. Unsupported."
                    }
                }
            }
        }

        ContentSubsection {
            title: "Fake screen rounding"

            ButtonGroup {
                id: fakeScreenRoundingButtonGroup
                property int selectedPolicy: ConfigOptions.appearance.fakeScreenRounding
                spacing: 2
                SelectionGroupButton {
                    property int value: 0
                    leftmost: true
                    buttonText: "No"
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        ConfigLoader.setConfigValueAndSave("appearance.fakeScreenRounding", value);
                    }
                }
                SelectionGroupButton {
                    property int value: 1
                    buttonText: "Yes"
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        ConfigLoader.setConfigValueAndSave("appearance.fakeScreenRounding", value);
                    }
                }
                SelectionGroupButton {
                    property int value: 2
                    rightmost: true
                    buttonText: "When not fullscreen"
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        ConfigLoader.setConfigValueAndSave("appearance.fakeScreenRounding", value);
                    }
                }
            }
        }

        ContentSubsection {
            title: "Shell windows"

            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: "Title bar"
                    checked: ConfigOptions.windows.showTitlebar
                    onCheckedChanged: {
                        ConfigLoader.setConfigValueAndSave("windows.showTitlebar", checked);
                    }
                }
                ConfigSwitch {
                    text: "Center title"
                    checked: ConfigOptions.windows.centerTitle
                    onCheckedChanged: {
                        ConfigLoader.setConfigValueAndSave("windows.centerTitle", checked);
                    }
                }
            }
        }
    }
}
