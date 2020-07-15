using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SpotifyWrapperApi.Models
{
    public class NewsModel
    {
        [Key]
        public int PostId { get; set; }
        public string PublicationDay { get; set; }
        public string PublicationTime { get; set; }
        public string PostAuthor { get; set; }
        public string PostTitle{ get; set; }
        public string PostContent { get; set; }
        public string PostPicture { get; set; }
    }
}
