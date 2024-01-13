using Microsoft.EntityFrameworkCore;
using usuarios.core.interfaces;
using usuarios.infra.Repository;
using Microsoft.Extensions.DependencyInjection;
using usuarios.infra.Context;

var builder = WebApplication.CreateBuilder(args); 

builder.Services.AddControllers();
builder.Services.AddDbContext<login_tiinduxContext>(options => {
    options.UseMySql(builder.Configuration.GetConnectionString("Mysql"),
    Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.28-mysql")
    );
}); 
builder.Services.AddScoped(typeof(IRepository<>), typeof(ApiRepository<>));
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(c => c.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin());

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.Run();
