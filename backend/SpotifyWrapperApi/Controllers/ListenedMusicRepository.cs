using System.Collections.Generic;
using System.Threading.Tasks;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Linq;
using SpotifyWrapperApi.Models;

namespace SpotifyWrapperApi.Controllers
{
    public class ListenedMusicRepository: ISpotifyApp
    {
        private readonly SpotifyAppContext _context;
        public ListenedMusicRepository(SpotifyAppContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<ListenedMusic>> GetAllTodos()
        {
            return await _context
                            .LMusic
                            .Find(_ => true)
                            .ToListAsync();
        }
        public Task<ListenedMusic> GetTodo(long id)
        {
            FilterDefinition<ListenedMusic> filter = Builders<ListenedMusic>.Filter.Eq(m => m.MusicId, id);
            return _context
                    .LMusic
                    .Find(filter)
                    .FirstOrDefaultAsync();
        }
        public async Task Create(ListenedMusic item)
        {
            await _context.LMusic.InsertOneAsync(item);
        }
        public async Task<bool> Update(ListenedMusic item)
        {
            ReplaceOneResult updateResult =
                await _context
                        .LMusic
                        .ReplaceOneAsync(
                            filter: g => g.MusicId == item.MusicId,
                            replacement: item);
            return updateResult.IsAcknowledged
                    && updateResult.ModifiedCount > 0;
        }
        public async Task<bool> Delete(long id)
        {
            FilterDefinition<ListenedMusic> filter = Builders<ListenedMusic>.Filter.Eq(m => m.MusicId, id);
            DeleteResult deleteResult = await _context
                                                .LMusic
                                              .DeleteOneAsync(filter);
            return deleteResult.IsAcknowledged
                && deleteResult.DeletedCount > 0;
        }
        public async Task<long> GetNextId()
        {
            return await _context.LMusic.CountDocumentsAsync(new BsonDocument()) + 1;
        }
    }
}
