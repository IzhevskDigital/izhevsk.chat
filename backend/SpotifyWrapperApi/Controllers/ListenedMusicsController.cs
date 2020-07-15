using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpotifyWrapperApi.Data;
using SpotifyWrapperApi.Models;

namespace SpotifyWrapperApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ListenedMusicsController : ControllerBase
    {
        private readonly SpotifyWrapperApiContext _context;

        public ListenedMusicsController(SpotifyWrapperApiContext context)
        {
            _context = context;
            //_context.ListenedMusic.Add(new ListenedMusic
            //{
            //    MusicName = "SuperStar",
            //    Favorit = true
            //});
            //_context.SaveChanges();
        }

        // GET: api/ListenedMusics
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ListenedMusic>>> GetListenedMusic()
        {
            return await _context.ListenedMusic.ToListAsync();
        }

        // GET: api/ListenedMusics/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<ListenedMusic>> GetListenedMusic(int id)
        {
            var listenedMusic = await _context.ListenedMusic.FindAsync(id);

            if (listenedMusic == null)
            {
                return NotFound();
            }

            return listenedMusic;
        }

        // PUT: api/ListenedMusics/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> PutListenedMusic(int id, ListenedMusic listenedMusic)
        {
            if (id != listenedMusic.MusicId)
            {
                return BadRequest();
            }

            _context.Entry(listenedMusic).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ListenedMusicExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ListenedMusics
        [HttpPost]
        public async Task<ActionResult<ListenedMusic>> PostListenedMusic(ListenedMusic listenedMusic)
        {
            _context.ListenedMusic.Add(listenedMusic);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetListenedMusic", new { id = listenedMusic.MusicId }, listenedMusic);
        }

        // DELETE: api/ListenedMusics/{id}
        [HttpDelete("{id}")]
        public async Task<ActionResult<ListenedMusic>> DeleteListenedMusic(int id)
        {
            var listenedMusic = await _context.ListenedMusic.FindAsync(id);
            if (listenedMusic == null)
            {
                return NotFound();
            }

            _context.ListenedMusic.Remove(listenedMusic);
            await _context.SaveChangesAsync();

            return listenedMusic;
        }

        private bool ListenedMusicExists(int id)
        {
            return _context.ListenedMusic.Any(e => e.MusicId == id);
        }
    }
}
