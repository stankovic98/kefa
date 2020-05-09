package model

type Parish struct{
	Id string
	Name string
	Priest string
	Articles Article[]
}

type Article struct{
	Creator string
	Title string
	Content string
	CreatedAt string
}