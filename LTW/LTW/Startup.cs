using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LTW.Startup))]
namespace LTW
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
