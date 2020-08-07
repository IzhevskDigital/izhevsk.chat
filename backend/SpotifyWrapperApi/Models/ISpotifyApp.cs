namespace SpotifyWrapperApi.Models
{
    using MongoDB.Driver;

    public class ISpotifyApp
    {
        IMongoCollection<ListenedMusic> LMusic { get; }
    }
}
