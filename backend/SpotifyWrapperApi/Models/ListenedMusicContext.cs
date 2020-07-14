using Microsoft.EntityFrameworkCore;

namespace SpotifyWrapperApi.Models
{
    public class ListenedMusicContext : DbContext
    {
        public ListenedMusicContext(DbContextOptions<ListenedMusicContext> options)
            : base(options)
        {
        }

        public DbSet<ListenedMusic> ListenedMusicItems { get; set; }
    }
}