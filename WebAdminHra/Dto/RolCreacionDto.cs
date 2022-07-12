namespace WebAdminHra.Dto
{
    public class RolCreacionDto
    {
        public int RolId { get; set; }
        public string Denominacion { get; set; } = "";
        public bool Estado { get; set; }

        public List<Models.ItemCheckBox> Menus { get; set; } = new List<Models.ItemCheckBox>();
    }
}
