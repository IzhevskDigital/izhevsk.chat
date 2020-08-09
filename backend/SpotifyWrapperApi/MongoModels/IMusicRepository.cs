using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpotifyWrapperApi.MongoModels
{
    public interface IMusicRepository
    {
        // api/[GET]
        Task<IEnumerable<ListenedMusicv2>> GetAllMusics();
        // api/1/[GET]
        Task<ListenedMusicv2> GetMusic(long id);
        // api/[POST]
        Task Create(ListenedMusicv2 item);  
        // api/[PUT]
        Task<bool> Update(ListenedMusicv2 item);
        // api/1/[DELETE]
        Task<bool> Delete(long id);
        Task<long> GetNextId();
    }
}
