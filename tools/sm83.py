import sys
R=['b','c','d','e','h','l','[hl]','a']
RP=['bc','de','hl','sp'];RP2=['bc','de','hl','af']
CC=['nz','z','nc','c']
ALU=['add a,','adc a,','sub ','sbc a,','and ','xor ','or ','cp ']
ROT=['rlc','rrc','rl','rr','sla','sra','swap','srl']
def op(d,pc):
    """d=rom bytes, pc=file offset; returns (len,text,target)"""
    o=d[pc];x=o>>6;y=(o>>3)&7;z=o&7;p=y>>1;q=y&1
    n=d[pc+1] if pc+1<len(d) else 0;nn=n|(d[pc+2]<<8 if pc+2<len(d) else 0)
    def rel(): return (pc+2+((n^0x80)-0x80))
    if x==0:
        if z==0:
            if y==0: return 1,'nop',None
            if y==1: return 3,'ld [$%04x],sp'%nn,None
            if y==2: return 2,'stop',None
            if y==3: return 2,'jr $%x'%rel(),('jr',rel())
            return 2,'jr %s,$%x'%(CC[y-4],rel()),('jrc',rel())
        if z==1: return (3,'ld %s,$%04x'%(RP[p],nn),None) if q==0 else (1,'add hl,%s'%RP[p],None)
        if z==2:
            m=['[bc]','[de]','[hl+]','[hl-]'][p]
            return 1,('ld %s,a'%m if q==0 else 'ld a,%s'%m),None
        if z==3: return 1,('inc ' if q==0 else 'dec ')+RP[p],None
        if z==4: return 1,'inc '+R[y],None
        if z==5: return 1,'dec '+R[y],None
        if z==6: return 2,'ld %s,$%02x'%(R[y],n),None
        return 1,['rlca','rrca','rla','rra','daa','cpl','scf','ccf'][y],None
    if x==1:
        if o==0x76: return 1,'halt',None
        return 1,'ld %s,%s'%(R[y],R[z]),None
    if x==2: return 1,ALU[y]+R[z],None
    if z==0:
        if y<4: return 1,'ret '+CC[y],('retc',None)
        return [(2,'ldh [$ff%02x],a'%n,None),(2,'add sp,$%02x'%n,None),(2,'ldh a,[$ff%02x]'%n,None),(2,'ld hl,sp+$%02x'%n,None)][y-4]
    if z==1:
        if q==0: return 1,'pop '+RP2[p],None
        return [(1,'ret',('ret',None)),(1,'reti',('ret',None)),(1,'jp hl',('ret',None)),(1,'ld sp,hl',None)][p]
    if z==2:
        if y<4: return 3,'jp %s,$%04x'%(CC[y],nn),('jpc',nn)
        return [(1,'ld [c],a',None),(3,'ld [$%04x],a'%nn,None),(1,'ld a,[c]',None),(3,'ld a,[$%04x]'%nn,None)][y-4]
    if z==3:
        if y==0: return 3,'jp $%04x'%nn,('jp',nn)
        if y==1:
            c=n;xx=c>>6;yy=(c>>3)&7;zz=c&7
            if xx==0: return 2,'%s %s'%(ROT[yy],R[zz]),None
            return 2,'%s %d,%s'%(['','bit','res','set'][xx],yy,R[zz]),None
        if y==6: return 1,'di',None
        if y==7: return 1,'ei',None
        return 1,'db $%02x'%o,None
    if z==4:
        if y<4: return 3,'call %s,$%04x'%(CC[y],nn),('call',nn)
        return 1,'db $%02x'%o,None
    if z==5:
        if q==0: return 1,'push '+RP2[p],None
        if p==0: return 3,'call $%04x'%nn,('call',nn)
        return 1,'db $%02x'%o,None
    if z==6: return 2,ALU[y]+'$%02x'%n,None
    return 1,'rst $%02x'%(y*8),('call',y*8)
def faddr(bank,addr): return addr if addr<0x4000 else bank*0x4000+addr-0x4000
if __name__=='__main__':
    d=open(sys.argv[1],'rb').read()
    bank=int(sys.argv[2],16);a=int(sys.argv[3],16);cnt=int(sys.argv[4]) if len(sys.argv)>4 else 60
    for i in range(cnt):
        f=faddr(bank,a);l,t,_=op(d,f)
        print('%02x:%04x  %-12s %s'%(bank,a,d[f:f+l].hex(),t));a+=l
