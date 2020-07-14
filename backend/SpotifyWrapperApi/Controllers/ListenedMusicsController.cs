using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpotifyWrapperApi.Models;

namespace SpotifyWrapperApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ListenedMusicsController : ControllerBase
    {
        private readonly ListenedMusicContext _context;

        public ListenedMusicsController(ListenedMusicContext context)
        {
            _context = context;
        }

        // GET: api/ListenedMusics
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ListenedMusic>>> GetListenedMusicItems()
        {
            return await _context.ListenedMusicItems.ToListAsync();
        }

        // GET: api/ListenedMusics/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ListenedMusic>> GetListenedMusic(int id)
        {
            var listenedMusic = await _context.ListenedMusicItems.FindAsync(id);

            if (listenedMusic == null)
            {
                return NotFound();
            }

            return listenedMusic;
        }

        // PUT: api/ListenedMusics/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
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
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<ListenedMusic>> PostListenedMusic(ListenedMusic listenedMusic)
        {
            _context.ListenedMusicItems.Add(listenedMusic);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetListenedMusicItems), new { id = listenedMusic.MusicId }, listenedMusic);
        }

        // DELETE: api/ListenedMusics/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ListenedMusic>> DeleteListenedMusic(int id)
        {
            var listenedMusic = await _context.ListenedMusicItems.FindAsync(id);
            if (listenedMusic == null)
            {
                return NotFound();
            }

            _context.ListenedMusicItems.Remove(listenedMusic);
            await _context.SaveChangesAsync();

            return listenedMusic;
        }

        private bool ListenedMusicExists(int id)
        {
            return _context.ListenedMusicItems.Any(e => e.MusicId == id);
        }
    }
}
