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
    public class NewsModelsController : ControllerBase
    {
        private readonly SpotifyWrapperApiContext _context;

        public NewsModelsController(SpotifyWrapperApiContext context)
        {
            _context = context;
            //_context.NewsModel.Add(new NewsModel
            //{
            //    PublicationDay = "12.09.2001",
            //    PublicationTime = "11:45",
            //    PostAuthor = "Pavel",
            //    PostTitle = "Новый альбом",
            //    PostContent = "Какой то текст",
            //    PostPicture = "none"
            //});
            //_context.SaveChanges();
        }

        // GET: api/NewsModels
        [HttpGet]
        public async Task<ActionResult<IEnumerable<NewsModel>>> GetNewsModel()
        {
            return await _context.NewsModel.ToListAsync();
        }

        // GET: api/NewsModels/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<NewsModel>> GetNewsModel(int id)
        {
            var newsModel = await _context.NewsModel.FindAsync(id);

            if (newsModel == null)
            {
                return NotFound();
            }

            return newsModel;
        }

        // PUT: api/NewsModels/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNewsModel(int id, NewsModel newsModel)
        {
            if (id != newsModel.PostId)
            {
                return BadRequest();
            }

            _context.Entry(newsModel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NewsModelExists(id))
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

        // POST: api/NewsModels
        [HttpPost]
        public async Task<ActionResult<NewsModel>> PostNewsModel(NewsModel newsModel)
        {
            _context.NewsModel.Add(newsModel);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNewsModel", new { id = newsModel.PostId }, newsModel);
        }

        // DELETE: api/NewsModels/{id}
        [HttpDelete("{id}")]
        public async Task<ActionResult<NewsModel>> DeleteNewsModel(int id)
        {
            var newsModel = await _context.NewsModel.FindAsync(id);
            if (newsModel == null)
            {
                return NotFound();
            }

            _context.NewsModel.Remove(newsModel);
            await _context.SaveChangesAsync();

            return newsModel;
        }

        private bool NewsModelExists(int id)
        {
            return _context.NewsModel.Any(e => e.PostId == id);
        }
    }
}
