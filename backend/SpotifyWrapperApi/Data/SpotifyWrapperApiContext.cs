using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SpotifyWrapperApi.Models;

namespace SpotifyWrapperApi.Data
{
    public class SpotifyWrapperApiContext : DbContext
    {
        public SpotifyWrapperApiContext (DbContextOptions<SpotifyWrapperApiContext> options)
            : base(options)
        {
        }

        public DbSet<SpotifyWrapperApi.Models.ListenedMusic> ListenedMusic { get; set; }

        public DbSet<SpotifyWrapperApi.Models.NewsModel> NewsModel { get; set; }
    }
}
