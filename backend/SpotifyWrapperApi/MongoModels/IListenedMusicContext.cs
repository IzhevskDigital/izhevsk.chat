using MongoDB.Driver;

namespace SpotifyWrapperApi.MongoModels
{
    public interface IListenedMusicContext
    {   
        IMongoCollection<ListenedMusicv2> Music { get; }
    }
}
