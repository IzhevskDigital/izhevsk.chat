using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace SpotifyWrapperApi.Models
{
    public class ListenedMusic
    {
        [Key]
        [BsonId]
        public ObjectId InternalId { get; set; }
        public long MusicId { get; set; }
        public string MusicName { get; set; }
        public bool Favorit { get; set; }
    }
}
