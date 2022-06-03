// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract estudiante 
{
    string private _nombre;
    string private _apellido;
    string private _nombre_completo;
    string private _curso;
    address private _docente;
    mapping (string => uint8) private notas_materias;
    int private _contador = 0; 
    int private _promedio;
    int private notas_totales;

    // Declaro todas las variables y diccionario necesarios

    constructor (string memory _nombre_, string memory _apellido_, string memory _curso_) 
    {
        _nombre = _nombre_;
        _apellido = _apellido_;
        _curso = _curso_;
        _docente = msg.sender;

        // Le pedimos al usuario de este contrato, que ingreso tanto su nombre como apellido y curso
        // Establecemos que el unico que puede setear los valores en el constructor sea quien la haya llamado, en este caso el docente
    }

    function apellido() public view returns (string memory)
    {
        return _apellido;

        // Devolvemos el apellido
    }

    function nombre_completo() public view returns (string memory)
    {
        return string (abi.encodePacked(_nombre, _apellido));
        //_nombre_completo = string.concat(_nombre,_apellido);

        // Concatenamos los strings de nombre y apellido en uno solo
    }

    function curso() public view returns(string memory)
    {
        return _curso;

        // Devolvemos el curso
    }

    function set_nota_materia(uint8 nota, string memory materia) public 
    {
        require(msg.sender == _docente, "Sola la docente puede poner notas");
        notas_materias[materia] = nota;
        _contador++;

        // Establecemos que el uncio que puede llamar esta funcion sea el que haya establecido los valores de apellido, nombre y curso, que es el docente

    }

    function nota_materia(string memory materia) public view returns (uint8)
    {
        return notas_materias[materia];
    } 

    function aprobo(string memory materia) public view returns (bool)
    {
        if (nota_materia[materia] < 60)
        {
            return false;
        }

        else if (nota_materia[materia] >= 60)
        {
            return true;
        }  
    }

    function promedio() public view returns (int)
    {
        for (int i = 0; i > _contador; i++)
        {
            notas_totales = notas_totales + notas_materias[i];
        }

        _promedio = notas_materias / _contador;

        return _promedio;

        // Checkear lo de LookUpTable
    }


}