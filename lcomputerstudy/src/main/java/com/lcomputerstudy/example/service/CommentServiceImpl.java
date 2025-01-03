package com.lcomputerstudy.example.service;

import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void addComment(Comment comment) {
        commentMapper.addComment(comment);
        commentMapper.updateGroup(comment.getcId());
    }
    
    @Override
    public void addReply(Comment comment) {
    	Comment parentComment = commentMapper.getCommentById(comment.getParentId());
    	
    	comment.setGroup(parentComment.getGroup());
    	comment.setOrder(parentComment.getOrder() + 1);
    	comment.setDepth(parentComment.getDepth() + 1);
    	comment.setParentId(parentComment.getcId());
    	
    	commentMapper.increaseOrder(parentComment.getGroup(), parentComment.getOrder());
    	
    	commentMapper.insertReply(comment);
    }
    
    @Override
    public List<Comment> ListCommentsByBid(int bId) {
        return commentMapper.ListCommentsByBid(bId);
    }
    
    @Override
    public List<Comment> ListReplies(int parentId) {
    	return commentMapper.ListReplies(parentId);
    }
    
    @Override
    public List<Comment> getAllComments(int bId) {
    	// 기존에 사용한 bId로 댓글 조회한걸 comments에 저장
    	List<Comment> comments = commentMapper.ListCommentsByBid(bId);
    	
    	// 각 댓글마다 대댓글 설정
    	for(Comment comment : comments) {
    		List<Comment> replies = commentMapper.ListReplies(comment.getcId());
    		comment.setReplies(replies);
    	}
    	
    	return comments;
    }

    @Override
    public void deleteComment(int cId) {
        commentMapper.deleteCommentAndRepl(cId);
        commentMapper.deleteCommentById(cId);
    }
    
    @Override
    public void deleteCommentByBid(int bId) {
    	commentMapper.deleteCommentByBid(bId);
    }
    
    @Override
    public Comment getCommentById(int cId) {
    	return commentMapper.getCommentById(cId);
    }
    
    @Override
    public void updateComment(Comment comment) {
        commentMapper.updateComment(comment);
    }
}