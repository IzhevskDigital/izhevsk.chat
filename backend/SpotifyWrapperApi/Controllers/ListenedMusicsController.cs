using System;
using System.Collections.Generic;
using System.Linq;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpotifyWrapperApi.Data;
using SpotifyWrapperApi.Models;

namespace SpotifyWrapperApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[Controller]")]
    public class TodosController : Controller
    {
        private readonly ListenedMusicRepository _repo;
        public TodosController(ListenedMusicRepository repo)
        {
            _repo = repo;
        }
        // GET api/todos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ListenedMusic>>> Get()
        {
            return new ObjectResult(await _repo.GetAllTodos());
        }
        // GET api/todos/1
        [HttpGet("{id}")]
        public async Task<ActionResult<ListenedMusic>> Get(long id)
        {
            var todo = await _repo.GetTodo(id);
            if (todo == null)
                return new NotFoundResult();

            return new ObjectResult(todo);
        }
        // POST api/todos
        [HttpPost]
        public async Task<ActionResult<ListenedMusic>> Post([FromBody] ListenedMusic item)
        {
            item.MusicId = await _repo.GetNextId();
            await _repo.Create(item);
            return new OkObjectResult(item);
        }
        // PUT api/todos/1
        [HttpPut("{id}")]
        public async Task<ActionResult<ListenedMusic>> Put(long id, [FromBody] ListenedMusic item)
        {
            var todoFromDb = await _repo.GetTodo(id);
            if (todoFromDb == null)
                return new NotFoundResult();
            item.MusicId = todoFromDb.MusicId;
            item.InternalId = todoFromDb.InternalId;
            await _repo.Update(item);
            return new OkObjectResult(item);
        }
        // DELETE api/todos/1
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(long id)
        {
            var post = await _repo.GetTodo(id);
            if (post == null)
                return new NotFoundResult();
            await _repo.Delete(id);
            return new OkResult();
        }
    }
}
