using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpotifyWrapperApi.Models
{
    public class SpotifyAppContext : ISpotifyApp
    {
        private readonly IMongoDatabase _db;
        public SpotifyAppContext(MongoDBConfig config)
        {
            var client = new MongoClient(config.ConnectionString);
            _db = client.GetDatabase(config.Database);
        }
        public IMongoCollection<ListenedMusic> LMusic => _db.GetCollection<ListenedMusic>("LMusic");
    }
}
