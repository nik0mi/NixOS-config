import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import ".."

/* NOTE:
*  This entire module is quite a mess, and is likely going to get a complete re-write.
*  I'm experimenting with creating the entire window frame/designs with SVG in order to
*  skip the need of creating everything out of rectangles and borders.
*
*/
Rectangle {
    id: root
    opacity: 1
    anchors.fill: parent
    color: Config.colors.base
    layer.enabled: true

    property int windowTitleDecorationWidth: 100
    property string windowTitle: "Window Title"
    property string windowTitleIcon: "\uf088"

    /*=== Top Bar Styling (name and bars) ===*/
    Item {
        anchors.left: parent.left
        anchors.right: parent.right
        implicitHeight: 25
        RowLayout {
            id: panelName
            anchors.centerIn: parent
            ColumnLayout {
                spacing: 1
                Repeater {
                    model: 4
                    Rectangle {
                        implicitHeight: 2
                        implicitWidth: windowTitleDecorationWidth
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: Config.colors.highlight
                            }
                            GradientStop {
                                position: 0.5
                                color: Config.colors.highlight
                            }
                            GradientStop {
                                position: 1.0
                                color: Config.colors.outline
                            }
                        }
                    }
                }
            }
            Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: iconFont.name
                font.pixelSize: 18
                opacity: 0.8
                text: root.windowTitleIcon
                color: Config.colors.text
            }
            Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: fontCharcoal.name
                font.pixelSize: 12
                text: root.windowTitle
                color: Config.colors.text
            }
            ColumnLayout {
                spacing: 1
                Repeater {
                    model: 4
                    Rectangle {
                        implicitHeight: 2
                        implicitWidth: windowTitleDecorationWidth
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: Config.colors.highlight
                            }
                            GradientStop {
                                position: 0.5
                                color: Config.colors.highlight
                            }
                            GradientStop {
                                position: 1.0
                                color: Config.colors.outline
                            }
                        }
                    }
                }
            }
        }
    }
    /*=== =============================== ===*/

    /*=== Window Frame (entire window frame) ===*/
    // As you can see here, I use a combination of *many* borders
    // in order to give a retro/pixel-style window frame around each
    // window. This is quite retarded.
    //
    // This is the initial and dumbest way of doing this, perhaps
    // in the future I can figure out to make a window frame with
    // SVG? I'm unsure of better alternatives as of now. For now
    // it at least looks the way I want it to look.
    NewBorder {
        commonBorderWidth: 4
        commonBorder: false
        lBorderwidth: 1
        rBorderwidth: 10
        tBorderwidth: 10
        bBorderwidth: 10
        zValue: 0
        borderColor: Config.colors.highlight
    }
    NewBorder {
        commonBorderWidth: 4
        commonBorder: false
        lBorderwidth: 10
        rBorderwidth: 1
        tBorderwidth: 10
        bBorderwidth: 1
        zValue: 0
        borderColor: Config.colors.shadow
    }
    NewBorder {
        commonBorderWidth: 1
        commonBorder: false
        lBorderwidth: 0
        rBorderwidth: 0
        tBorderwidth: 10
        bBorderwidth: 0
        zValue: 0
        borderColor: Config.colors.outline
    }

    NewBorder {
        commonBorderWidth: 1
        commonBorder: false
        lBorderwidth: -7
        rBorderwidth: -7
        tBorderwidth: -7 - 20
        bBorderwidth: -7
        zValue: 0
        opacity: 0.5
        borderColor: Config.colors.outline
    }
    NewBorder {
        commonBorderWidth: 1
        commonBorder: false
        lBorderwidth: -8
        rBorderwidth: -8
        tBorderwidth: -8 - (20)
        bBorderwidth: -8
        zValue: 0
        opacity: 0.2
        borderColor: Config.colors.outline
    }
    Rectangle {
        id: innerOutline
        anchors {
            fill: parent
            margins: 6
        }
        anchors.topMargin: 6 + 20
        color: "transparent"
        implicitWidth: parent.width
        implicitHeight: 4
        border.width: 1
        border.color: Config.colors.outline
    }
    /*=== ================================== ===*/
}
