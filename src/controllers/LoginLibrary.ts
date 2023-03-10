import { Libraries } from "../entity/Libraries"; 
import { comparePasswords,hash } from "../common/bcrypt.helpers";
import { getRepository, SimpleConsoleLogger } from "typeorm";
import { response } from "express";
        
const LIBRARY_RELATIONS = { relations: ['books'] }; 
const NO_LIBRARY_RELATIONS = {}; 

export const validateLogin = async (email: string, password: string): Promise<Libraries> => {
    let libraryLogin: Libraries = null;

    const library = await findByEmail(email); 

    if (library) { 
        
        const { password: hashedPassword } = library;
        
        const isPasswordEquals = await comparePasswords(password, hashedPassword); 
        if (isPasswordEquals){ 
            libraryLogin = library;  
        } if (!isPasswordEquals) { 

       } 
        
    }     
   
        
    return libraryLogin; 
}
  
export const findByEmail = async (email: string, relations=true): Promise<Libraries> => {
    const libraryRelation = relations ? LIBRARY_RELATIONS : NO_LIBRARY_RELATIONS;
    const library = await getRepository(Libraries).findOne({
        where: { email },
        ...libraryRelation,
    });

    return library;  
}
 
