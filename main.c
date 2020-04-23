/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmoreau <vmoreau@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/14 18:03:55 by vmoreau           #+#    #+#             */
/*   Updated: 2020/04/23 02:36:11 by vmoreau          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
# define NC "\033[0m"
# define BLACK "\033[0;30m"
# define RED "\033[0;31m"
# define GREEN "\033[32m"
# define YELLOW "\033[33;33m"
# define BLUE "\033[0;34m"
# define PURPLE "\033[35m"
# define CYAN "\033[1;36m"
# define WHITE "\033[0;37m"

size_t	ft_strlen(const char *s);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s1);

int main()
{
	// Strlen
	printf("%sTest FT_STRLEN :\n%s", CYAN, NC);
	char *str = "|Coucou les boys|";
	printf("Me: %zu | Base : %zu\n", ft_strlen(str), strlen(str));
	printf("%s#--------------------#%s\n", RED, NC);

	// Write
	int ret = 0;
	printf("%sTest FT_WRITE :%s\n", CYAN, NC);
	write(1, "Me:   ", 6);
	ret = ft_write(1, str, ft_strlen(str));
	printf("\n%d\n", ret);
	write(1, "Base: ", 6);
	ret = write(1, str, strlen(str));
	printf("\n%d", ret);
	printf("\n%s#--------------------#%s\n", RED, NC);

	// Read
	printf("%sTest FT_READ :\n%s", CYAN, NC);
	int fd = open("./text", O_RDONLY);
	ret = 1;
	int nb_read = 5;
	char stock[nb_read + 1];
	while (ret > 0)
	{
		ret = read(fd, stock, -1);
		if (ret > -1)
			printf("%s",stock);
		else
			printf("%d", ret);
	}
	printf("\n%s#--------------------#%s\n", RED, NC);

	// Strcpy
	printf("%sTest FT_STRCPY :\n%s", CYAN, NC);
	char dst[100] = "piou piou";
	char *src = "BLEU BLI BLU";
	printf("Return:     %s\nModif Dest: %s\n", ft_strcpy(dst, src), dst);
	printf("%s#--------------------#%s\n", RED, NC);

	// Strcmp
	printf("%sTest FT_STRCMP :\n%s", CYAN, NC);
	char *s1 = "q";
	char *s2 = "";
	printf("Me: %d | Base: %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
	printf("%s#--------------------#%s\n", RED, NC);

	// Strdup
	printf("%sTest FT_STRDUP :\n%s", CYAN, NC);
	char *dup;
	dup = ft_strdup(str);
	printf("%s\n", dup);
	printf("%s#--------------------#%s\n", RED, NC);
	return (0);
}
