using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace SpotifyWrapperApi.MongoModels
{
    public class ListenedMusicv2
    {
        [BsonId]
        public ObjectId InternalId { get; set; }
        public long Id { get; set; }
        public string Name { get; set; }
        public string Author { get; set; }
        public bool Favorit { get; set; }
    }
}