using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SpotifyWrapperApi.Models
{
    public class ListenedMusic
    {
        [Key]
        public int MusicId { get; set; }
        public string MusicName { get; set; }
        public bool Favorit { get; set; }
    }
}
