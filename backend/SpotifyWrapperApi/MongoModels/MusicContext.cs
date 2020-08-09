using MongoDB.Driver;
using SpotifyWrapperApi.Config;

namespace SpotifyWrapperApi.MongoModels
{
    public class MusicContext : IListenedMusicContext
    {
        private readonly IMongoDatabase _db;
        public MusicContext(MongoDBConfig config)
        {
            var client = new MongoClient(config.ConnectionString);
            _db = client.GetDatabase(config.Database);
        }
        public IMongoCollection<ListenedMusicv2> Music => _db.GetCollection<ListenedMusicv2>("Musics");
    }
}
