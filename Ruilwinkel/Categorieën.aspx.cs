﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ruilwinkel
{
    public partial class Categorieën : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAddCategory_Click(object sender, EventArgs e)
        {
            Logger.WriteLog(TextBoxCategorieNaam.Text + " wordt aangemaakt.");
            Categorie categorie = new Categorie(TextBoxCategorieNaam.Text, int.Parse(TextBoxCategoriePunten.Text));
            categorie.Toevoegen(categorie);
        }
    }
}