// function encryptMessage(message, password) {
//   key = asmCrypto.PBKDF2_HMAC_SHA256.base64(password, 'some_salt', '', 12);
//   return asmCrypto.AES_CBC.encrypt( message, key);
// }
//
// function decryptMessage(hash, password) {
//   key = asmCrypto.PBKDF2_HMAC_SHA256.base64(password, 'some_salt', '', 12);
//   decrypted = asmCrypto.AES_CBC.decrypt(hash, key);
//   return new TextDecoder("utf-8").decode(decrypted);
// }
//
// function encryptAndUpdate() {
//   var pswd = $('#message-password').val();
//   var mess = $('#message-text').val();
//   var encrypted = encryptMessage(mess, pswd);
//   $('#message-encrypted-message').val(encrypted);
// }
//
// $('.messsages.index').ready(function() {
//   $( "#message-form" ).submit(function( event ) {
//     console.log('encrypting..');
//
//     encryptAndUpdate();
//     console.log('sending...');
//   });
// });
//
// $('.messsages.create').ready(function() {
//   $( "#message-form" ).submit(function( event ) {
//     console.log('encrypting..');
//
//     encryptAndUpdate();
//     console.log('sending...');
//   });
// });
//
// $('.message.show').ready(function() {
//   var pswd = prompt("Please type password to encrypt message");
//
//   if (pswd != null) {
//     try {
//       message = decryptMessage(encrypted_value, pswd)
//       $('.well.well-sm').text('qwesadasdsddqwe')
//     } catch(e) {
//       if (e instanceof SecurityError) {
//        alert('Password incorrect!');
//      } else {
//        console.log(e);
//      }
//     }
//   }
// });
