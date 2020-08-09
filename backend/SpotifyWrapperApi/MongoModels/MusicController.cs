using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace SpotifyWrapperApi.MongoModels
{
    [Produces("application/json")]
    [Route("api/[Controller]")]
    public class MusicController : Controller
    {
        private readonly IMusicRepository _repo;
        public MusicController(IMusicRepository repo)
        {
            _repo = repo;
        }
        // GET api/todos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ListenedMusicv2>>> Get()
        {
            return new ObjectResult(await _repo.GetAllMusics());
        }
        // GET api/todos/1
        [HttpGet("{id}")]
        public async Task<ActionResult<ListenedMusicv2>> Get(long id)
        {
            var todo = await _repo.GetMusic(id);
            if (todo == null)
                return new NotFoundResult();

            return new ObjectResult(todo);
        }
        // POST api/todos
        [HttpPost]
        public async Task<ActionResult<ListenedMusicv2>> Post([FromBody] ListenedMusicv2 item)
        {
            item.Id = await _repo.GetNextId();
            await _repo.Create(item);
            return new OkObjectResult(item);
        }
        // PUT api/todos/1
        [HttpPut("{id}")]
        public async Task<ActionResult<ListenedMusicv2>> Put(long id, [FromBody] ListenedMusicv2 item)
        {
            var todoFromDb = await _repo.GetMusic(id);
            if (todoFromDb == null)
                return new NotFoundResult();
            item.Id = todoFromDb.Id;
            item.InternalId = todoFromDb.InternalId;
            await _repo.Update(item);
            return new OkObjectResult(item);
        }
        // DELETE api/todos/1
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(long id)
        {
            var post = await _repo.GetMusic(id);
            if (post == null)   
                return new NotFoundResult();
            await _repo.Delete(id);
            return new OkResult();
        }
    }
}