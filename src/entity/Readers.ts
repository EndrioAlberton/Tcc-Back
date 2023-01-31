import {Entity, PrimaryGeneratedColumn, Column, ManyToMany, OneToMany, ManyToOne, JoinColumn } from 'typeorm'; 
import { Libraries } from './Libraries';
import { Loans } from './Loans';
 
@Entity() 
export class Readers { 
     
    @PrimaryGeneratedColumn() 
    id: number; 
 
    @ManyToMany(
        () => Libraries,
        libraries => libraries.readers,
        { onDelete: "CASCADE"}
      )
      libraries: Libraries[];     
     
    @ManyToOne(
        () => Loans,
        loan => loan.reader,
        {onDelete: "CASCADE"}
    )   
    @JoinColumn(({name:"loanIdReader"}))
    loans: Loans;   
       
    @Column({length: 50}) 
    email: string;  
     
    @Column() 
    password: string;  
     
    @Column({length: 50}) 
    nome: string;   
     
     
    @Column({length: 11}) 
    cpf: string; 
      
    @Column({length: 11}) 
    telphone: string;   
     
     
 } 
