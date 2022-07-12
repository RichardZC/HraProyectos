namespace WebAdminHra.Dto
{
    public class UsuarioCreacionDto
    {
        public int UsuarioId { get; set; }
        public string NombreUsuario { get; set; } = string.Empty;
        public string Contraseña { get; set; } = string.Empty;
        public string Paterno { get; set; } = string.Empty;
        public string Materno { get; set; } = string.Empty;
        public string Nombres { get; set; } = string.Empty;
        public string Dni { get; set; } = string.Empty;
        public string Celular { get; set; }
        public string Sexo { get; set; }

        public bool Estado { get; set; }

        public List<Models.ItemCheckBox> Roles { get; set; } = new List<Models.ItemCheckBox>();
    }
}
