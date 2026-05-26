import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 620
    height: 480
    visible: true
    title: qsTr("Kalculadora")
    //definicion de variables para manipular visual
    property string funcionActiva: "";
    property string baseLog: "";
    property string argLog: "";

    //una funcion que va a procesar las teclas ingresadas
    function procesarEntrada(botonPresionado)
    {

       /* switch(botonPresionado)
        {
            case "logx()":
                funcionActiva = "log"
                baseLog = ""
                argLog = ""
                pantallaPrincipal.text = "log_? (?)"
                break;
            case "*10^x":
                pantallaPrincipal.text = "*10^"
                break;
            case ""

        } */

        //teclado de funciones cientificas
        if(botonPresionado === "logx()")
        {
            funcionActiva = "log"
            baseLog = ""
            argLog = ""
            pantallaPrincipal.text += "log_? (?)"
        }
        else if(botonPresionado.includes("("))
        {
            funcionActiva = botonPresionado.replace(")", "")
            pantallaPrincipal.text += funcionActiva
        }

        if(funcionActiva == "log" && botonPresionado !== "logx()")
        {
            if(baseLog == "") //si no hay base, tome el primer numero de entrada
            {
                baseLog = botonPresionado
                pantallaPrincipal.text = "log_" + baseLog + " (?)"
                botonPresionado = ""
            }
            else if(argLog == "") // si ya hay base, pero no argumento
            {
                argLog = botonPresionado
                pantallaPrincipal.text = "log_" + baseLog + " " + "(" + argLog + ")"
                funcionActiva = "" // limpio la funcion guardada
                botonPresionado = ""
            }
        }
        /* else
        {
            pantallaPrincipal.text+= botonPresionado
        } */

        //teclado de opciones y operadores
        if(botonPresionado === "AC")
        {
            pantallaPrincipal.text = "" //borra todo
        }
        else if(botonPresionado === "DEL")
        {
            pantallaPrincipal.text = pantallaPrincipal.text.slice(0, -1) //borra el ultimo elemento
        }
        else if(botonPresionado === "=")
        {
            //logica qe llama a c++ ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        } /*
        else if(botonPresionado.includes(["+", "-", "*", "/"]))
        {
            pantallaPrincipal.text += " " + botonPresionado + " "
        } */

        //donde gestiono que muestro
        switch(botonPresionado)
        {
            case "+":
            case "-":
            case "*":
            case "/":
                pantallaPrincipal.text += " " + botonPresionado + " "
                break;
            case "AC":
            case "DEL":
            case "=":
            case "ANS":
            case "logx()":
            case "D <--> S":
            case "D <--> B":
            case "ln()":
            case "sen()":
            case "cos()":
            case "tan()":
            case "sen()^-1":
            case "cos()^-1":
            case "tan()^-1":
                botonPresionado = "";
            break;
            case "*10^x":
                pantallaPrincipal.text += "x10^"
                break;
            case "x^2":
                pantallaPrincipal.text += "^2";
                break;
            case "x^y":
                pantallaPrincipal.text += "^";
                break;
            case "x!":
                pantallaPrincipal.text += "!";
                break;
            case "1/x":
                pantallaPrincipal.text += "1/";
                break;
            default:
                pantallaPrincipal.text += botonPresionado;
        }
    }

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
                    model: ["sqrt()", "xroot()", "x^2", "x^y", "logx()", "ln()", "sen()", "cos()", "tan()", "sen^-1()", "cos^-1()", "tan^-1()", "D <--> S", "D <--> B", "x!", "e", "pi", "1/x", "(", ")"]
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
                            //van a ocurrir muchas cosas aca para manejar las salidas visuales y la logica detras
                            /* if(modelData === "logx()")
                            {
                                funcionActiva = "log"
                                baseLog = ""
                                argLog = ""
                                pantallaPrincipal.text = "log_? (?)"
                            }

                            if(funcionActiva == "log")
                            {
                                if(baseLog == "") //si no hay base, tome el primer numero de entrada
                                {
                                    baseLog = modelData
                                    pantallaPrincipal.text = "log_" + baseLog + " (?)"
                                }
                                else if(argLog == "") // si ya hay base, pero no argumento
                                {
                                    argLog = modelData
                                    pantallaPrincipal.text = "log_" + baseLog + " " + "(" + argLog + ")"
                                    funcionActiva = "" // limpio la funcion guardada
                                }
                            }
                            else
                            {
                                pantallaPrincipal.text+= modelData
                            } */

                            //pantallaPrincipal.text+=modelData
                            procesarEntrada(modelData)
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
                    model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "*10^x"]

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
                            //console.log("Presionaste el botón: " + text)
                            /*if(modelData === "*10^x")
                            {
                                pantallaPrincipal.text += "*10^"
                            }
                            else
                                pantallaPrincipal.text += modelData; */
                            procesarEntrada(modelData)
                        }
                    }
                }
            }

            GridLayout {
                columns: 2
                Repeater {
                    model: ["DEL", "AC", "*", "/", "+", "-", "ANS", "="]

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
                            //como es con js, puedo controlar con un if else sencillo
                            //incluso, puedo prosar las entradas mejor de forma global llamando una funcion
                            /*
                            if(modelData === "AC")
                            {
                                pantallaPrincipal.text = "" //borra todo
                            }
                            else if(modelData === "DEL")
                            {
                                pantallaPrincipal.text = pantallaPrincipal.text.slice(0, -1) //borra el ultimo elemento
                            }
                            else if(modelData === "=")
                            {
                                //logica qe llama a c++
                            }
                            else
                            {
                                pantallaPrincipal.text += " " + modelData + " "
                            } */
                            procesarEntrada(modelData)
                        }
                    }
                }
            }
        }


    }


}

