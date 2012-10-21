package org.j2cms.service.impl;


import org.j2cms.model.article.Article;
import org.j2cms.service.ArticleService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class ArticleServiceImpl extends DaoSupport<Article> implements ArticleService {

}
