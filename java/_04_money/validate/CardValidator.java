package _04_money.validate;

import java.util.regex.Pattern;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import _01_register.model.StudentBean_H;
import _04_money.model.CardBean;


@Component
@Scope("prototype")
public class CardValidator implements Validator {
	
	private static final Pattern PASSWORD_PATTERN = Pattern.compile("((?=.*\\d)(?=.*[a-z]).{6,})");
	private static final Pattern Email_PATTERN = Pattern.compile("^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$");
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return StudentBean_H.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		

		CardBean cb = (CardBean) target;

		
		
		if (cb.getName() != null && cb.getName().length() < 1 || cb.getName().length() > 5) {
			errors.rejectValue("name", "", "姓名欄位格式不正確");
		}
//
//		if (st.getPassword() != null  && !PASSWORD_PATTERN.matcher(st.getPassword()).matches()) {
//			errors.rejectValue("password", "studentBean.password.space", "密碼至少含有一個小寫字母，且長度不能小於六個字元");
//		}
//		
//		if (st.getPasswordcheck() != null && st.getPassword() != null && !st.getPasswordcheck().equals(st.getPassword())
//		) {
//			errors.rejectValue("passwordcheck", "studentBean.password.mustEqual", "密碼欄位並須和密碼確認一致");
//		}
//
//		if (st.getEmail() == null || !Email_PATTERN.matcher(st.getEmail()).matches()) {
//			errors.rejectValue("email", "studentBean.email.invalid", "必須包含@符號，必須包含點，點和@之間必須有字元");
//		}
//		
//		if (st.getBirthday() == null) {
//			errors.rejectValue("birthday", "studentBean.birthday", "生日欄位格式不正確");
//		}
//		if (st.getSex() == null) {
//			errors.rejectValue("sex", "studentBean.sex", "性別欄位格式不正確");
//		}


	}

}
