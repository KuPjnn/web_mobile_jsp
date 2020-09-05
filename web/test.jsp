<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>test</title>
    <script src="<c:url value="/lib/JSEncrypt/jsencrypt.min.js"/>"></script>
    <script src="<c:url value="/lib/JSEncrypt/cryptojs.min.js"/>"></script>
</head>

<body>

</body>
<%--<script>
    /*====================================   Generate key   ====================================*/
    function arrayBufferToBase64(arrayBuffer) {
        var byteArray = new Uint8Array(arrayBuffer);
        var byteString = '';
        for (let i = 0; i < byteArray.byteLength; i++) {
            byteString += String.fromCharCode(byteArray[i]);
        }
        return window.btoa(byteString);
    }

    function addNewLines(str) {
        let results = '';
        while (str.length > 0) {
            results += str.substring(0, 64) + '\n';
            str = str.substring(64);
        }
        return results;
    }

    function privateKeyToPem(privateKey) {
        var base64 = addNewLines(arrayBufferToBase64(privateKey));
        return "-----BEGIN PRIVATE KEY-----\n" + base64 + "-----END PRIVATE KEY-----";
    }

    function publicKeyToPem(privateKey) {
        var base64 = addNewLines(arrayBufferToBase64(privateKey));
        return "-----BEGIN PUBLIC KEY-----\n" + base64 + "-----END PUBLIC KEY-----";
    }

    function generateKeyRSA(username) {
        window.crypto.subtle.generateKey(
            {
                name: "RSA-PSS",
                modulusLength: 1024, //kích thước khóa 1024, 2048, or 4096
                publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
                hash: {name: "SHA-256"}, //can be "SHA-1", "SHA-256", "SHA-384", or "SHA-512"
            },
            true, //cho phép exportKey
            ["sign", "verify"] //quy định chức năng các khóa (privateKey = sign và publicKey = verify)
        ).then(function (key) {
            window.crypto.subtle.exportKey(
                "spki",
                key.publicKey
            ).then(function (publicKey) {
                const pem = publicKeyToPem(publicKey);
                /*
                * register
                */
            }).catch(function (err) {
                console.log(err);
            });

            window.crypto.subtle.exportKey(
                "pkcs8",
                key.privateKey
            ).then(function (privateKey) {
                const pem = privateKeyToPem(privateKey);
                exportPrivateKey(pem, username)
            }).catch(function (err) {
                console.log(err);
            });
        }).catch(function (err) {
            console.error(err);
        });
    }

    function exportPrivateKey(data, username) {
        let a = document.createElement('a');
        a.href = "data:application/octet-stream," + encodeURIComponent(data);
        a.download = username + '.private';
        a.click();
    }

    function importPrivateKey(pem) {
        // fetch the part of the PEM string between header and footer
        const pemHeader = "-----BEGIN PRIVATE KEY-----";
        const pemFooter = "-----END PRIVATE KEY-----";
        const pemContents = pem.substring(pemHeader.length, pem.length - pemFooter.length);
        // base64 decode the string to get the binary data
        const binaryDerString = window.atob(pemContents);
        // convert from a binary string to an ArrayBuffer
        const binaryDer = str2ab(binaryDerString);

        return window.crypto.subtle.importKey(
            "pkcs8",
            binaryDer,
            {
                name: "RSA-PSS",
                modulusLength: 1024,
                publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
                hash: "SHA-256",
            },
            true,
            ["sign"]
        );
    }

    function str2ab(str) {
        const buf = new ArrayBuffer(str.length);
        const bufView = new Uint8Array(buf);
        for (let i = 0, strLen = str.length; i < strLen; i++) {
            bufView[i] = str.charCodeAt(i);
        }
        return buf;
    }

    /*phương thức ký*/
    function signatures(data, key) {
        var sign = new JSEncrypt();
        sign.setPrivateKey(key);
        return sign.sign(data, CryptoJS.SHA256, "sha256");
    }

</script>--%>
<%--<script>
    var input = document.getElementById("inputPrivateKey");
    var output = document.getElementById("outputPrivateKey");

    input.addEventListener("change", function () {
        if (this.files && this.files[0]) {
            var myFile = this.files[0];
            var reader = new FileReader();

            reader.addEventListener('load', function (e) {
                output.textContent = e.target.result;
            });
            reader.readAsBinaryString(myFile);
        }
    });

    function signatures(data) {
        const key = document.getElementById("output").value;

        var sign = new JSEncrypt();
        sign.setPrivateKey(key);
        return sign.sign(data, CryptoJS.SHA256, "sha256");
    }
</script>--%>
</html>
