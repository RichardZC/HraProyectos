using System;
using FluentValidation;
using Empresa.Ecommerce.Application.DTO;

namespace Empresa.Ecommerce.Application.Validator
{
    public class UsersDtoValidator : AbstractValidator<UsersDto>
    {
        public UsersDtoValidator()
        {
            RuleFor(u => u.UserName).NotNull().NotEmpty();
            RuleFor(u => u.Password).NotNull().NotEmpty();
        }
    }
}
