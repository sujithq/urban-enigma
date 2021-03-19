using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace urban_enigma.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly IConfiguration Configuration;


        public IndexModel(ILogger<IndexModel> logger, IConfiguration configuration)
        {
            _logger = logger;
            Configuration = configuration;
        }

        public void OnGet()
        {
            var envValue = Configuration["env"];

            switch (envValue)
            {
                case "local":
                    ViewData["env"] = "my local computer";
                    break;
                case "gh":
                    ViewData["env"] = "a Github Action";
                    break;
                case "ui":
                    ViewData["env"] = "an Azure Devops Pipeline and a Release";
                    break;
                case "yaml":
                    ViewData["env"] = "an Azure Devops YAML Pipeline";
                    break;
                default:
                    break;
            }
        }
    }
}
