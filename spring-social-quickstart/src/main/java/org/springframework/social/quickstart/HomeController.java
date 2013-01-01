/*
 * Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.social.quickstart;

import static org.springframework.util.Assert.notNull;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.env.Environment;
import org.springframework.social.facebook.DialogType;
import org.springframework.social.facebook.Display;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookLink;
import org.springframework.social.facebook.api.Post;
import org.springframework.social.facebook.api.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.HtmlUtils;

/**
 * Simple little @Controller that invokes Facebook and renders the result.
 * The injected {@link Facebook} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Keith Donald
 */
@Controller
public class HomeController {

	@Inject
	private Environment environment;
	
	private final Facebook facebook;
	private final String backFromFacebookPath = "/backFromFacebook";
	
	@Inject
	public HomeController(Facebook facebook) {
		this.facebook = facebook;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}

	@RequestMapping(value = "/viewFriends", method = RequestMethod.GET)
	public String friends(Model model) {
		List<Reference> friends = facebook.friendOperations().getFriends();
		model.addAttribute("friends", friends);
		return "friends";
	}

	@RequestMapping(value = "/postOnWall", method = RequestMethod.GET)
	public String postOnWall(Model model) {
		FacebookLink facebookLink = new FacebookLink("www.herdwisdom.com", "Herd Wisdom", "http://www.herdwisdom.com/images/interface/blog_banner.png", "A wonderfull company");
		String postId = facebook.feedOperations().postLink("Message personnel sur mon mur", facebookLink);
		
		model.addAttribute("postId", postId);
		return "posted";
	}

	@RequestMapping(value = "/messages", method = RequestMethod.GET)
	public String readMessages(Model model) {
		List<Post> messages = facebook.feedOperations().getFeed();
		
		if (messages == null || messages.isEmpty()) {
			model.addAttribute("messageCount", 0);
		} else {
			model.addAttribute("messageCount", messages.size());
		}
		model.addAttribute("messages", messages);
		return "messages";
	}

	private String buildFacebookDialogUri(HttpServletRequest request, DialogType dialogType, Display display) {
		StringBuilder facebookSendDialogUrl = new StringBuilder("https://www.facebook.com/dialog/").append(dialogType.name());
		
//		System.out.println(request.getRequestURL());
//		System.out.println(request.getProtocol());
//		System.out.println(request.getScheme());
//		System.out.println(request.getServerName());
//		System.out.println(request.getServerPort());
//		System.out.println(request.getContextPath());
//		System.out.println(request.getServletPath());
		String redirectUri = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + backFromFacebookPath;
		
		// TODO sendMessage with a form post, and put parameters in the model to let RedirectView use them as parameters
		facebookSendDialogUrl.append("?")
			.append("app_id=").append(environment.getProperty("facebook.clientId"))
			.append("&").append("redirect_uri=").append(HtmlUtils.htmlEscape(redirectUri))
			.append("&").append("display=").append(display.name())
			.append("&").append("link=").append(HtmlUtils.htmlEscape("http://www.herdwisdom.com/"))
			.append("&").append("picture=").append(HtmlUtils.htmlEscape("http://www.herdwisdom.com/images/interface/blog_banner.png"))
			.append("&").append("name=").append(HtmlUtils.htmlEscape("a wonderfull company"));
		
		String url = facebookSendDialogUrl.toString();
		return url;
	}

	@RequestMapping(value = backFromFacebookPath, method = RequestMethod.GET)
	public String backFromFacebookDialog(HttpServletRequest req, Model model) {
		model.addAttribute("requestUrl", req.getRequestURL());
		model.addAttribute("queryString", req.getQueryString());
		return "backFromFacebook";
	}
	

	@RequestMapping(value = "/openDialog", method = RequestMethod.POST)
	public String openFacebookDialog(HttpServletRequest request, HttpServletResponse response,
			@RequestParam DialogType dialogType, @RequestParam Display display) throws Exception {
		
		notNull(dialogType);
		notNull(display);
		
		String facebookDialogUri = buildFacebookDialogUri(request, dialogType, display);
		
		new RedirectView(facebookDialogUri, false).render(null, request, response);
		return null;
	}

}