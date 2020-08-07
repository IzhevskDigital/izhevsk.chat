using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SpotifyWrapperApi.Models
{
    public class ProfileModel
    {
        [Key]
        public string Username { get; set; }
        public string Subscribe { get; set; }
        public string ProfileImg { get; set; }
        public string ProfileEmail { get; set; }
    }
}
