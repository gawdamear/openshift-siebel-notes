using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api.Controllers
{
    public class NotesController : Controller
    {
        [HttpGet("siebel/notes")]
        public string Get()
        {
            return "Recieving!";
        }
    }
}
