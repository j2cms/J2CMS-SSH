package org.j2cms.service.impl;

import org.j2cms.model.comment.Comment;
import org.j2cms.service.CommentService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class CommentServiceImpl extends DaoSupport<Comment> implements CommentService {
}
