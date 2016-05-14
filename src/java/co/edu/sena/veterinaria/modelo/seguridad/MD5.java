/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.seguridad;

import java.security.MessageDigest;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

/**
 * Clase que ayuda a encriptar las contraseñas.
 * @author Alejandro Ramírez
 */
public class MD5 {
    
    /**
     * Metodo que encripta una cadena de caracteres.
     * @param contraseña Cadena de caracteres.
     * @return String con la cadena encriptada.
     */
    public static String encriptar(String contraseña) {
        String secretKey = "$5x#07$/.|gJl5JzA%S2?.4s5./as,4G¿3h92L2"; //llave para encriptar datos
        String base64EncryptedString = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digestOfPassword = md.digest(secretKey.getBytes("UTF-8"));
            byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
            SecretKey key = new SecretKeySpec(keyBytes, "DESede");
            Cipher cipher = Cipher.getInstance("DESede");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] plainTextBytes = contraseña.getBytes("UTF-8");
            byte[] buf = cipher.doFinal(plainTextBytes);
            byte[] base64Bytes = Base64.encodeBase64(buf);
            base64EncryptedString = new String(base64Bytes);
        } catch (Exception ex) {
        }
        return base64EncryptedString;
    }
}
