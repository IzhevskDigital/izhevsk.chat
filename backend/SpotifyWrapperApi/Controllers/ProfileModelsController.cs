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
    public class ProfileModelsController : ControllerBase
    {
        private readonly SpotifyWrapperApiContext _context;

        public ProfileModelsController(SpotifyWrapperApiContext context)
        {
            _context = context;

            _context.ProfileModel.Add(new ProfileModel
            {
                ProfileEmail = "example@SpotifyWrapper.com",
                Username = "_grasth",
                Subscribe = "Premium",
                ProfileImg = "none"
            });

            _context.ProfileModel.Add(new ProfileModel
            {
                ProfileEmail = "example_user@SpotifyWrapper.com",
                Username = "_user",
                Subscribe = "Free",
                ProfileImg = "none"
            });
        }

        // GET: api/ProfileModels/{username}
        [HttpGet("{username}")]
        public async Task<ActionResult<ProfileModel>> GetProfileModel(string username)
        {
            //var profileModel = await _context.ProfileModel.FindAsync(username);

            var getProfile = await _context.ProfileModel.FindAsync(username);
            if (getProfile == null)
            {
                return NotFound();
            }

            return getProfile;
        }

        //// PUT: api/ProfileModels/{username}
        //[HttpPut("{username}")]
        //public async Task<IActionResult> PutProfileModel(string username, ProfileModel profileModel)
        //{
        //    if (username != profileModel.Username)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(profileModel).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!ProfileModelExists(username))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}
        
        private bool ProfileModelExists(string id)
        {
            return _context.ProfileModel.Any(e => e.Username == id);
        }
    }
}
