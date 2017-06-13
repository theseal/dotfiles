#!/bin/bash

source_dir=$(dirname $0)
kernel=$(uname)
mail=$1

for file in $(ls -a ${source_dir} | egrep '^\.[^.]+' | egrep -v '^\.git$'); do
    if [ "${file}" == ".slate" ] || [ "${file}" == ".Brewfile" ]; then
        if [ "${kernel}" != "Darwin" ]; then
            continue
        fi
    fi

    if [ "${file}" == ".gitconfig" ]; then

        if [ ! ${mail} ]; then
            echo "Enter git commit mail, followed by [ENTER];"
            read mail
        fi

        sed "s/%%PLACEHOLDER%%/${mail}/" ${source_dir}/${file} > ~/${file}
        continue
    fi

    cp ${source_dir}/${file} ~/

done

echo "Dotfiles installed, enjoy."
