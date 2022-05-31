// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract estudiante 
{
    string private nombre;
    string private apellido;
    string private _nombre_completo;
    string private curso;
    address private docente;
    mapping (string => uint) private notas_materias;

    // Declaro todas las variables y diccionario necesarios

    constructor (string memory _nombre, string memory _apellido, string memory _curso) 
    {
        nombre = _nombre;
        apellido = _apellido;
        curso = _curso;
        docente = msg.sender;

        // Le pedimos al usuario de este contrato, que ingreso tanto su nombre como apellido y curso
        // Establecemos que el unico que puede setear los valores en el constructor sea quien la haya llamado, en este caso el docente
    }

    function apellidoF() public view returns (string memory)
    {
        return apellido;

        // Devolvemos el apellido
    }

    function nombre_completo() public view returns(string memory)
    {
        return string (abi.encodePacked(nombre, apellido));
        //_nombre_completo = string.concat(nombre,apellido);
    }

    function cursoF() public view returns(string memory)
    {
        return curso;
    }

    function set_nota_materia(uint nota, string memory materia) public 
    {
        require(msg.sender == docente, "Sola la docente puede poner notas");
        notas_materias[materia] = nota;
    }

    function nota_materia(string memory materia) public view returns (uint)
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
}