using System.Security.Cryptography;
using System.Text;

namespace WebAdminHra.Helper
{
    public class Encriptar
    {
        public static string EncriptaMD5(string mensaje)
        {
            string hash = "semillaHRA";
            byte[] data = UTF8Encoding.UTF8.GetBytes(mensaje);
            MD5 md5 = MD5.Create();
            var triple = TripleDES.Create();
            triple.Key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
            triple.Mode = CipherMode.ECB;
            var transform = triple.CreateEncryptor();
            var result = transform.TransformFinalBlock(data, 0, data.Length);

            return Convert.ToBase64String(result);
        }
        public static string DesencriptaMD5(string mensaje)
        {
            try
            {
                string hash = "semillaHRA";
                byte[] data = Convert.FromBase64String(mensaje);

                MD5 md5 = MD5.Create();
                var triple = TripleDES.Create();

                triple.Key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                triple.Mode = CipherMode.ECB;

                var transform = triple.CreateDecryptor();
                var result = transform.TransformFinalBlock(data, 0, data.Length);

                return Encoding.UTF8.GetString(result);
            }
            catch (Exception)
            {
               return string.Empty;
            }
        }
    }
}
