#!/bin/bash 


run () {
    cd ../DataScience-Project
    jupyter notebook  project.ipynb
   
}


report () {
    cd "../Informe"
    pdflatex informe.tex
    echo "Archivo Informe.pdf creado con éxito"
}


slides () {
    cd "../Presentación"
    pdflatex presentación.tex
    echo "Archivo Presentación.pdf creado con éxito"
}


show_report () {
    pdf_path="../Informe/informe.pdf"
    if [ ! -f "$pdf_path"]; then
        pdflatex "../Informe/informe.tex"
    fi
    echo "Por favor, introduce el nombre del visualizador de PDF que deseas utilizar:"
    read visualizador

    echo "Abriendo el PDF con $visualizador..."
    $visualizador "$pdf_path"
    start ../Informe/informe.pdf 
}


show_slides () {
    pdf_path="../Presentación/presentación.pdf"
    if [ ! -f "$pdf_path"]; then
        pdflatex "../Presentación/presentación.tex"
    fi
    echo "Por favor, introduce el nombre del visualizador de PDF que deseas utilizar:"
    read visualizador

    echo "Abriendo el PDF con $visualizador..."
    $visualizador "$pdf_path"
    start ../Presentación/presentación.pdf  
}

clean () {
    rm -f "../Informe/informe.aux"
    rm -f "../Informe/informe.out"
    rm -f "../Informe/informe.aux"
    rm -f "../Informe/informe.log"
    rm -f "../Informe/informe.pdf"
    rm -f "../Informe/informe.toc"
    rm -f "../Presentación/presentación.aux"
    rm -f "../Presentación/presentación.synctex.gz"
    rm -f "../Presentación/presentación.log"
    rm -f "../Presentación/presentación.nav"
    rm -f "../Presentación/presentación.out"
     rm -f "../Presentación/presentación.pdf"
    rm -f "../Presentación/presentación.snm"
    rm -f "../Presentación/presentación.toc"
}



Menú () {

    echo "1.run"
    echo "2.report"
    echo "3.slides"
    echo "4.show_report"
    echo "5.show_slides"
    echo "6.clean"

    read -p "Ingrese una opción: " opcion
    case $opcion in
        1)
            run
            ;;
        2)
            report
            ;;
        3)
            slides
            ;;
        4)
            show_report
            ;;
        5)
            show_slides
            ;;
        6)
            clean

    esac

}

while true; do
    clear
    Menú
done




