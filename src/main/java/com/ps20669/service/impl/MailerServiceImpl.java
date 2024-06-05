package com.ps20669.service.impl;

import java.io.File;
import java.lang.ProcessHandle.Info;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ps20669.bean.MailInfo;
import com.ps20669.model.Account;
import com.ps20669.service.MailerService;

@Service
public class MailerServiceImpl implements MailerService {
	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfo mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());

		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}
		String[] bcc = mail.getBcc();
		if (bcc != null && bcc.length > 0) {
			helper.setBcc(bcc);
		}
		String[] attachments = mail.getAttachments();
		if (attachments != null && attachments.length > 0) {
			for (String path : attachments) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}
		sender.send(message);
	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		this.send(new MailInfo(to, subject, body));
	}
	
	@Override
	public void sendFeedback(String from, String to, String subject, String body) throws MessagingException {
		this.send(new MailInfo(from, to, subject, body));
		
	}

	List<MailInfo> queue = new ArrayList<>();

	@Override
	public void queue(MailInfo mail) {
		queue.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInfo(to, subject, body));
	}

	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!queue.isEmpty()) {
			MailInfo mail = queue.remove(0);
			try {
				send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to tuan store";
	private static final String EMAIL_FORGOT_PASSWORD = " Send New Password";

	@Override
	public void sendEmail(Account recipient, String type) throws MessagingException {
		try {
			String content = null;
			String subject = null;
			if (type.contains("welcome")) {
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Dear: " + recipient.getFullname() + ", Welcome to Online Entertainment";
			} else if (type.contains("forgot_Pass")) {
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear: " + recipient.getFullname() + ", Your new password here: " + recipient.getPassword();
			} else {
				subject = "tuan dep trai";
				content = "This is the error email. please don't mind it !";
			}
			send(recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}