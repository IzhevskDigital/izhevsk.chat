using System.Collections.Generic;
using System.Threading.Tasks;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Linq;

namespace SpotifyWrapperApi.MongoModels
{
    public class MusicRepository : IMusicRepository
    {
        private readonly IListenedMusicContext _context;

        public MusicRepository(IListenedMusicContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<ListenedMusicv2>> GetAllMusics()
        {
            return await _context
                            .Music
                            .Find(_ => true)
                            .ToListAsync();
        }
        public Task<ListenedMusicv2> GetMusic(long id)
        {
            FilterDefinition<ListenedMusicv2> filter = Builders<ListenedMusicv2>.Filter.Eq(m => m.Id, id);
            return _context
                    .Music
                    .Find(filter)
                    .FirstOrDefaultAsync();
        }
        public async Task Create(ListenedMusicv2 item)
        {
            await _context.Music.InsertOneAsync(item);
        }
        public async Task<bool> Update(ListenedMusicv2 item)
        {
            ReplaceOneResult updateResult =
                await _context
                        .Music
                        .ReplaceOneAsync(
                            filter: g => g.Id == item.Id,
                            replacement: item);
            return updateResult.IsAcknowledged
                    && updateResult.ModifiedCount > 0;
        }
        public async Task<bool> Delete(long id)
        {
            FilterDefinition<ListenedMusicv2> filter = Builders<ListenedMusicv2>.Filter.Eq(m => m.Id, id);
            DeleteResult deleteResult = await _context
                                                .Music
                                              .DeleteOneAsync(filter);
            return deleteResult.IsAcknowledged
                && deleteResult.DeletedCount > 0;
        }
        public async Task<long> GetNextId()
        {
            return await _context.Music.CountDocumentsAsync(new BsonDocument()) + 1;
        }
    }
}
