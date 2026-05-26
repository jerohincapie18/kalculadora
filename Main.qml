import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 620
    height: 480
    visible: true
    title: qsTr("Kalculadora")

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        TextField {
            id: pantallaPrincipal
            placeholderText: "holiwis"
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            font.pointSize: 25
            horizontalAlignment: TextInput.AlignRight
            color: "black"
            background:
                Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    radius: 2
                    color: black
                    border.color: "#e0e0e0"
                }
        }

        RowLayout {
            GridLayout {
                columns: 5

                Repeater {
                    //sqrt() reemplazado por el icono
                    model: ["sqrt()", "nroot()", "x^2", "x^y", "logx()", "ln()", "sen()", "cos()", "tan()", "sen^-1()", "cos^-1()", "tan^-1()", "D <--> S", "D <--> B", "x!", "e", "pi", "1/x", "(", ")"]
                    Button {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        font.pixelSize: 18
                        //icon.source: modelData
                        //icon.source: "qrc:/qt/qml/kalculadora/icons/backspace.svg"
                        //icon.color: "transparent"
                        //icon.name: "edit-clear"
                        text: modelData
                        Layout.preferredWidth: 70
                        Layout.preferredHeight: 40

                        onClicked: {
                            pantallaPrincipal.text+=modelData
                        }
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

                        font.pixelSize: 20
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        text: modelData //modelData toma el valor actual

                        contentItem:
                            Text {
                                text: parent.text
                                font: parent.font
                                color: "black"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                        background:
                            Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: parent.height
                            radius: 4
                            color: "#e0e0e0"
                        }

                        // un comportamiento general para los botones
                        onClicked: {
                            console.log("Presionaste el botón: " + text)
                            pantallaPrincipal.text+=modelData
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
                        font.pixelSize: 20
                        Layout.fillHeight: true
                        //estilos del texto
                        // usare condicion ? si_es_verdadero : si_es_falso para pintar y manipuladr botones
                        contentItem:
                            Text {
                                text: parent.text
                                font: parent.font
                                //font.pixelSize: 20
                                color: parent.text === "=" ? "white" : "black" // si es =, texto blanco, si no, negro
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                        //color de fondo
                        background:
                            Rectangle {
                                implicitWidth: parent.width
                                implicitHeight: parent.height
                                radius: 4 // Bordes redondeados estilo nativo

                                // Si el botón actual es "=", píntalo naranja, si no, ponle un gris suave
                                color: modelData === "=" ? "#ff9500" : "#e0e0e0"
                            }

                        onClicked: {
                            //console.log("Presionaste el botón")
                            pantallaPrincipal.text+=modelData
                        }
                    }
                }
            }
        }


    }


}

