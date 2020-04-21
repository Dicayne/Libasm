/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmoreau <vmoreau@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/14 18:03:55 by vmoreau           #+#    #+#             */
/*   Updated: 2020/04/22 01:27:20 by vmoreau          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

size_t	ft_strlen(const char *s);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strcpy(char * dst, const char * src);

int main()
{
	// Strlen
	char *str = "Coucou les boys\n";
	printf("Test FT_STRLEN :\n");
	printf("%zu\n..........\n", ft_strlen(str));
	// Write
	printf("Test FT_WRITE :\n");
	ft_write(1, str, ft_strlen(str));
	printf("..........\n");
	// Read
	printf("Test FT_READ :\n");
	int fd = open("./test", O_RDONLY);
	int ret = 1;
	char stock[6];
	while (ret > 0)
	{
		ret = ft_read(-1, stock, 5);
		printf("%d %s",ret, stock);
	}
	printf("\n..........\n");
	// Strcpy
	printf("Test FT_STRCPY :\n");
	char dst[100] = "piou piou";
	char *src = "BLEU BLI BLU";
	printf("Return: %s\nModif Dest: %s\n", ft_strcpy(dst, src), dst);
	printf("..........\n");
	return (0);
}
