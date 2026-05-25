import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 520
    height: 450
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        TextField {
            placeholderText: "holiwis"
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            font.pointSize: 25
            horizontalAlignment: TextInput.AlignRight
        }

        RowLayout {
            GridLayout {
                columns: 5

                Repeater {
                    //sqrt() reemplazado por el icono
                    model: ["sqrt()", "rt()", "x^2", "x^y", "logx()", "ln()", "sen()", "cos()", "tan()", "sen^-1()", "cos^-1()", "tan^-1()", "D<->S", "D<->B", "x!", "e", "pi", "1/x", "(", ")"]
                    Button {
                        Layout.fillWidth: true
                        //icon.source: modelData
                        //icon.source: "qrc:/qt/qml/kalculadora/icons/backspace.svg"
                        //icon.color: "transparent"
                        //icon.name: "edit-clear"
                        text: modelData
                        Layout.preferredWidth: 70
                        Layout.preferredHeight: 40
                    }
                }
            }
        }

        RowLayout {
            //rejilla de 3 columnas
            GridLayout {
                columns: 3 // se van ordenando automaticamente

                // el repetidor itera sobre una lista de textos para los bootnes
                Repeater {
                    model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "x10^x"]

                    //duplicar por cada elemento de la lista anterior
                    Button {
                        Layout.fillWidth: true
                        text: modelData //modelData toma el valor actual

                        // un comportamiento general para los botones
                        onClicked: {
                            console.log("Presionaste el botón: " + text)
                        }
                    }
                }
            }

            GridLayout {
                columns: 2
                Repeater {
                    model: ["DEL", "AC", "X", "/", "+", "-", "ANS", "="]

                    Button {
                        text: modelData
                        onClicked: {
                            console.log("Presionaste el botón")
                        }
                    }
                }
            }
        }


    }


}

