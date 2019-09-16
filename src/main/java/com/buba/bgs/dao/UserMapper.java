package com.buba.bgs.dao;

import com.buba.bgs.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**FV
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-28 20:39
 **/
public interface UserMapper {
    User login(@Param("usercode")String usercode,@Param("password")String password);

    List<User> findUser(int depFtId);
}
