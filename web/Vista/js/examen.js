/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $.ajax({
        url: '/Veterinaria/ControladorExamen?cargarExamenes=true',
        type: 'post',
        datatype: 'json',
        success: function(dtos) {
            var json = eval('(' + dtos + ')');
            for (var i = 0; i < json.length; i++) {
                $("#tabla tbody").after("<tr><td>" + json[i].codigo + "</td><td>"+
                        json[i].nombre + "</td><td>" + json[i].notas + "</td></tr>");
            }
        }
    });
});
